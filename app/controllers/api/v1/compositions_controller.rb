class Api::V1::CompositionsController < ApplicationController
  skip_before_action :authorized, only: %i[create show update]

  def create
    @composition = Composition.create(composition_params)
    @composition = Composition.update(@composition.id, tempo: 120)

    32.times do
      note = Note.create(duration: 'qr', composition_id: @composition.id)
      Position.create(str: 0, fret: '', note_id: note.id)
    end

    render json: { composition: @composition },
           status: :created
  end

  def show
    @composition = Composition.find(params[:id])
    render json: { composition: @composition },
           include: %i[notes positions],
           status: :created
  end

  def update
    @composition = Composition.find(params[:id])
    @notes = @composition.notes.sort_by(&:id)
    tab_notes = save_params[:tabNotes]
    @notes.each_with_index do |note, note_index|
      new_note = tab_notes[note_index]
      index = 0
      if note.positions.length >= new_note[:positions].length
        while index < new_note[:positions].length
          new_positions = new_note[:positions]
          new_position = new_positions[index]
          Position.update(note.positions[index].id,
                          str: new_position[:str],
                          fret: new_position[:fret])
          index += 1
        end

        while index < note.positions.length
          Position.delete(note.positions[index].id)
          index += 1
        end
      else
        while index < note.positions.length
          new_positions = new_note[:positions]
          new_position = new_positions[index]
          Position.update(note.positions[index].id,
                          str: new_position[:str],
                          fret: new_position[:fret])
          index += 1
        end

        while index < new_note[:positions].length
          new_position = new_note[:positions][index]
          Position.create(str: new_position[:str],
                          fret: new_position[:fret],
                          note_id: note.id)
          index += 1
        end
      end
      Note.update(note.id, duration: tab_notes[note_index][:duration])
    end

    Composition.update(params[:id], tempo: save_params[:tempo].to_i)

    @composition = Composition.find(params[:id])

    render json: { composition: @composition },
           include: %i[notes positions],
           status: :created
  end

  private

  def composition_params
    params.require(:composition).permit(:title, :artist, :user_id)
  end

  def save_params
    params.require(:composition).permit(:tempo, tabNotes: [{ positions: %i[str fret] }, :duration])
  end
end
