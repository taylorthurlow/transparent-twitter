module ChartHelper
  def generate_chartkick(tones)
    scores = get_scores_hash(tones)
    bar_chart(scores,
      min: 0,
      max: 2.5
    )
  end

  private

  def get_scores_hash(tones)
    graph_data = {}
    tones.each do |tone|
      # change the 0.50..1.00 value to a 0.0..10.0 value, and then apply
      # a logarithmic scale, because watson really doesn't like giving high
      # values.
      score = (((tone['score'].to_f - 0.50) * 10.0) / (1.00 - 0.50)).round(1)
      graph_data[tone['tone_name'].downcase.to_sym] = Math.log(score + 1)
    end
    return graph_data
  end
end
