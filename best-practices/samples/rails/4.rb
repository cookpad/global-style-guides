# When setting context

## Bad
class EntriesController < ApplicationController
  before_action :set_contest

  def index
    @entries = @contest.entries
  end

  private

    def set_contest
      @contest = Contest.find(params[:contest_id])
    end
end

## Good
class EntriesController < ApplicationController
  def index
    @entries = contest.entries
  end

  private

    def contest
      @_contest ||= Contest.find(params[:contest_id])
    end
end

# When assiging vars to use in view

## Bad
class EntriesController < ApplicationController
  before_action :set_entry

  def show
  end

  private

    def set_entry
      @entry = contest.entries.find(params[:id])
    end
end

## Good
class EntriesController < ApplicationController
  def show
    @entry = contest.entries.find(params[:id])
  end
end

## If particular complicated/used more than once in the controller:
class EntriesController < ApplicationController
  def show
    @entry = entry
  end

  def update
    @entry = entry
    if @entry.update(entry_params)
      redirect_to @entry
    else
      render :edit
    end
  end

  private

    def entry
      @_entry ||=  contest.entries.published.active.find(params[:id])
    end
end
