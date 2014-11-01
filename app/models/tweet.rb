class Tweet < ActiveRecord::Base
  belongs_to :user
  after_create :schedule_job


  def schedule_job
    ScheduledTweetJob.perform_at(self.scheduled_time, self.id)
  end

end
