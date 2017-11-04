class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    comments_path = Comment
    @model = Comment
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    comments_path = Comment
    @model = Comment
  end

  # GET /comments/new
  def new
    comments_path = Comment
    @model = Comment
    @post = params[:post_id]
    @comment = Comment.new
    @comment.post_id = @post
  end

  # GET /comments/1/edit
  def edit
    comments_path = Comment
    @model = Comment
  end

  # POST /comments
  # POST /comments.json
  def create
    comments_path = Comment
    @model = Comment
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    current_user.comments.create(params[:comment])
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    comments_path = Comment
    @model = Comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    comments_path = Comment
    @model = Comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment

comments_path = Comment
      @model = Comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params

comments_path = Comment
      @model = Comment
      params.require(:comment).permit(:body, :post, :user)
    end
end
