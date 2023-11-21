class MoneyTracksController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @money_track = MoneyTrack.new
  end

  def create
    # we need a new group
    @group = Group.find([group_id])

    # we create a ne money_track by assigning the add_noney_track params to @group

    @money_track = @group.add_money_track(money_track_params)
    redirect_to @group

    # `rescue ActiveRecord::RecordInvalid` is a rescue clause that is used to handle an exception of
    # type `ActiveRecord::RecordInvalid`. This exception is raised when a record fails validation and
    # cannot be saved to the database. In this case, if the `@group.add_money_track(required_params)`
    # method raises a `RecordInvalid` exception, the code will redirect the user back to the `new`
    # action with the `group_id` parameter, allowing them to correct any validation errors and try
    # again.
    rescue ActiveRecord::RecordInvalid
    
      # then we render the new money track
      render new, group_id: group_id
  end

  private

  def group_id
    params.dig(:money_track, :group_id) || params[:group_id]
  end

  def money_track_params
    params.require(:money_track).permit(:name, :amount).merge(user: current_user)
  end
end
