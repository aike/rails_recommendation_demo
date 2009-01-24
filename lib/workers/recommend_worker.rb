class RecommendWorker < BackgrounDRb::MetaWorker
  set_worker_name :recommend_worker

  def create(args = nil)
  end

  def do_analyze
    logger.info(Time.now.to_s + " recommendation data ANALYZE start")
    system('/home/cicindela/bin/batch.pl')
    logger.info(Time.now.to_s + " recommendation data ANALYZE end")
  end

  def do_flush
    logger.info(Time.now.to_s + " recommendation data FLUSH start")
    system('/home/cicindela/bin/flush_buffers.pl')
    logger.info(Time.now.to_s + " recommendation data FLUSH end")
  end

end

