json.movies @movies.each do |movie|
  json.title movie.title
  json.photo movie.photo
end
