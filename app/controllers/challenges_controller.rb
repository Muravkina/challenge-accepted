class ChallengesController <ApplicationController
  def new
    @user = User.find(params[:user_id])
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new
    @challenge.name = params['challenge']['name']
    @challenge.description = params['challenge']['description']
    @challenge.location = params['challenge']['location']
    @challenge.img_url = params['challenge']['img_url']
    @challenge.time_limit = params['challenge']['time_limit']
    @challenge.is_proof_required = params['challenge']['is_proof_required']
    @challenge.proof_description = params['challenge']['proof_description']
    @challenge.sample_url = params['challenge']['sample_url']
    @challenge.is_public = params['challenge']['is_public']
    @challenge.challenger_email = params['challenge']['challenger_email']
    @challenge.creator_id = current_user.id
    @creator = User.find(@challenge.creator_id)
    if @challenge.save
      if params['challenge']['tags'] != "" && params['challenge']['tags'] != nil
        tags = @challenge.tags.tr(',', '').tr('#','').split()
        tags.each do |tag|
          @tag = Tag.new
          @tag.name = tag
          @tag.challenge_id = @chalenge.id
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
        @user_accepted_challenge.proofs.build if @user_accepted_challenge.proofs.length < 3
    end
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @user_created_challenges = @user.created_challenges
    else
      @challenges = Challenge.all
    end
  end

  def in_progress
    @user = User.find(params[:user_id])
    @user_challenges = @user.accepted_challenges.where('is_accomplished = false')
    render :in_progress
  end

  def accomplished
    @user = User.find(params[:user_id])
    @user_challenges = @user.accepted_challenges.where('is_accomplished = true')
    render :accomplished
  end


end

