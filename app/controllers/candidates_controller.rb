class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
     @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to '/candidates' , notice: 'Candidate created !'
    
   else
      render :new    
   end
  end

  def show 
    @candidate = Candidate.find_by(id: params[:id])
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update

    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_params)
      redirect_to '/candidates', notice: "Candidate Updated!"
    else
      render :edit
    end
  end

  def destroy

    @candidate = Candidate.find_by(id: params[:id])

    @candidate.destroy
    
    redirect_to '/candidates' , notice: 'Candidate Deleted!'
  end


  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :politics)
  end
end
