class ApiImportDailyWorker
  @queue = :api_import_daily_worker

  def self.perform
    Site.update_scores
  end
end
