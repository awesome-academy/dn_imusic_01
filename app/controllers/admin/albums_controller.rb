class Admin::AlbumsController < Admin::BaseController
  before_action :load_album, except: %i(index new create)
  before_action :change_params, only: %i(create update)

  def index
    @albums = Album.sort_by_name.paginate page: params[:page]
  end

  def new
    @album = Album.new
    @album_songs = @album.album_songs.build
  end

  def edit; end

  def show; end

  def create
    @album = Album.new album_params.merge album_songs_attributes: @album_songs_attributes
    if @album.save
      flash[:success] = t ".success"
      redirect_to admin_albums_path
    else
      flash.now[:danger] = t ".fail"
      render :new
    end
  end

  def update
    Album.transaction do
      delete_album_song @album
      if @album.update album_params.merge album_songs_attributes: @album_songs_attributes
        flash[:success] = t ".success"
        redirect_to admin_albums_path
      else
        flash.now[:danger] = t ".fail"
        render :edit
      end
    end
  end

  def destroy
    if @album.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to admin_albums_path
  end

  private

  def album_params
    params.require(:album).permit Album::ATTR_PARAMS
  end

  def load_album
    @album = Album.find_by id: params[:id]
    return if @album

    flash[:danger] = t ".not_found_album"
    redirect_to admin_albums_path
  end

  def delete_album_song album
    album.album_songs.delete_all
  end

  def change_params
    @album_songs_attributes = []
    # params_as = params[:album][:album_songs_attributes]["0"][:song_id].reject(&:blank?)
    params_as = params[:album][:song_ids].reject(&:blank?)
    params_as.each do |a|
      @album_songs_attributes << {song_id: a}
    end
  end
end
