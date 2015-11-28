json.array!(@videos) do |video|
  json.extract! video, :id, :description, :video
  json.url video_url(video, format: :json)
end
