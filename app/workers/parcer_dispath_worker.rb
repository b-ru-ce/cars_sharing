class ParcerDispathWorker
  include Sidekiq::Worker

  def perform()
  	Partner.all.each do |partner|
      ParcerWorker.perform_async(partner.id)
    end
  end
end
