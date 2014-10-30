class Tweet < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  after_create :schedule_job


  def schedule_job
    ScheduledTweetJob.perform_at(self.scheduled_time, self.id)
  end

end
