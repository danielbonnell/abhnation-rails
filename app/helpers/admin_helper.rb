module AdminHelper
  def created_or_updated(record)
    if record.updated_at > record.created_at
      "updated #{record.updated_at.strftime("%b %e, %l:%M %p")}"
    else
      "created #{record.created_at.strftime("%b %e, %l:%M %p")}"
    end
  end

  def recent_activity
    activity = []
    results = []

    User.all.order("updated_at DESC").limit(5).each do |record|
      activity << record
    end

    Category.all.order("updated_at DESC").limit(5).each do |record|
      activity << record
    end

    Article.all.order("updated_at DESC").limit(5).each do |record|
      activity << record
    end

    activity.sort_by &:updated_at
    activity.reverse!

    activity[0..9].each_with_index do |record, index|
      if record.class == User
        results << "#{record.class.to_s} #{record.username} #{created_or_updated(record)}."
      elsif record.class == Article
        results << "#{record.class.to_s} #{record.slug} #{created_or_updated(record)}."
      elsif record.class == Category
        results << "#{record.class.to_s} #{record.name} #{created_or_updated(record)}."
      end
    end

    results
  end
end
