class ChallengesController <ApplicationController
  before_action :authorize, except: [:show, :index, :in_progress, :accomplished]

  def new
    @user = User.find(params[:user_id])
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.creator_id = current_user.id
    @creator = User.find(@challenge.creator_id)
    if @challenge.save
      if params['tags'] != "" && params['tags'] != nil
        tags = params['tags'].tr(',', '').tr('#','').split()
        tags.each do |tag|
          @tag = Tag.new
          @tag.name = tag
          @tag.challenge_id = @challenge.id
          @tag.save
        end
      end
      if @challenge.is_public != true
        UserMailer.invite_email(@challenge.challenger_email, @creator, @challenge).deliver_now

        if User.find_by({email: params['challenge']['challenger_email']})
          @user = User.find_by({email: params['challenge']['challenger_email']})
          @challenge.challenger_id = @user.id
        end
      end
      redirect_to "/challenges/#{@challenge.id}"
    else
      render :new
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @author = User.find(@challenge.creator_id)
    @challenger = User.find_by({email: @challenge.challenger_email})
    @tags = @challenge.tags
    if current_user
      @user = User.find(session[:user_id])
      if @user.accepted_challenges.find_by({challenge_id: params[:id]})
        @user_accepted_challenge = @user.accepted_challenges.find_by({challenge_id: params[:id]})
        @user_accomplished_challenge = (@user_accepted_challenge && @user_accepted_challenge.is_accomplished == true)
        if @challenge.proof_description == "Photo" || @challenge.proof_description == "Link"
          @user_accepted_challenge.proofs.build if @user_accepted_challenge.proofs.length < 3
        else
          @user_accepted_challenge.proofs.build if @user_accepted_challenge.proofs.length < 1
        end
    end
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    if !params[:user_id].nil?
      @user = User.find(params[:user_id])
      if current_user == @user
        @user_created_challenges = @user.created_challenges
      else
        @user_created_challenges = @user.created_challenges.where('is_public = true')
      end
    else
      @challenges = Challenge.all.where('is_public = true')

    end
  end

  def in_progress
    @user = User.find(params[:user_id])
    if current_user == @user
      @user_challenges = @user.accepted_challenges.where('is_accomplished = false')
    else
      user_challenges = @user.accepted_challenges.joins(:challenge).where("challenges.is_public = true")
      @user_challenges = user_challenges.where('is_accomplished = false')
    end
    render :in_progress
  end

  def accomplished
    @user = User.find(params[:user_id])
    if current_user == @user
      @user_challenges = @user.accepted_challenges.where('is_accomplished = true')
    else
      user_challenges = @user.accepted_challenges.joins(:challenge).where("challenges.is_public = true")
      @user_challenges = user_challenges.where('is_accomplished = true')
    end
    render :accomplished
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params)
      if params['tags'] != "" && params['tags'] != nil
        tags = params['tags'].tr(',', '').tr('#','').split()
        tags.each do |tag|
          unless Tag.find_by(:name => tag)
          @tag = Tag.new
          @tag.name = tag
          @tag.challenge_id = @challenge.id
          @tag.save
        end
        end
      end
      redirect_to "/challenges/#{@challenge.id}"
    else
      render :new
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to '/challenges'
  end

def challenge_params
    params.require(:challenge).permit!
  end



end

