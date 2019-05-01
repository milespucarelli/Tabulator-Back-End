class Api::V1::CompositionsController < ApplicationController
  skip_before_action :authorized, only: %i[create show update]

  def create
    @composition = Composition.create(composition_params)

    36.times do
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
    composition = Composition.find(params[:id])
    @notes = composition.notes
    tab_notes = save_params[:tabNotes]
    puts tab_notes
    @notes.each_with_index do |note, note_index|
      new_note = tab_notes[note_index]
      note.positions.each_with_index do |position, position_index|
        new_positions = new_note[:positions]
        new_position = new_positions[position_index]
        Position.update(position.id,
                        str: new_position[:str],
                        fret: new_position[:fret])
      end
      Note.update(note.id, duration: tab_notes[note_index][:duration])
    end

    @notes.each do |note|
      note.positions.each { |position| puts "#{position.str} #{position.fret}" }
    end

    render json: { composition: @composition },
           status: :created
  end

  private

  def composition_params
    params.require(:composition).permit(:title, :artist, :user_id)
  end

  def save_params
    params.require(:composition).permit(tabNotes: [{ positions: %i[str fret] }, :duration])
  end
end
