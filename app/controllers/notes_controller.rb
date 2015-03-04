class NotesController < ApplicationController

  def testIns
    puts "In testIns method of NotesController"

    note = Note.new(title: 'Another Test title for note ' + rnd(1, 100000).to_s,
                    url: 'http://localhost:3000',
                    note: 'This is a test note of course!',
                    username: 'some_user_id',
                    guid: UUIDTools::UUID.random_create)

    note.save!

    render json: { status: 'success' }, status: :ok
  end

  def show
    note = Note.find_by_guid(params[:id])
    render json: note, status: :ok
  end


  private
    def rnd(min, max)
      min + rand(max-min)
    end

end
