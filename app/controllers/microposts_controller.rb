class MicropostsController < ApplicationController
  # GET /microposts
  def index
    @micropost = Micropost.new
    @microposts = Micropost.all.order("created_at desc")
  end

  # POST /microposts
  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to microposts_url, notice: "Micropost was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1 or /microposts/1.json
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to microposts_url, notice: "Micropost was successfully destroyed." }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def micropost_params
      params.require(:micropost).permit(:content, :username)
    end
end
