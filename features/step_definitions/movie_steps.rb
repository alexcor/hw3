# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
    # debugger
  end
  # flunk "Unimplemented"

  assert Movie.all.count == movies_table.hashes.size

end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  # flunk "Unimplemented"
  debugger
  assert page.body.find(e1) >= page.body.find(e2) 
end

Then /^I should see none of the movies$/ do
    moviesInPage = page.all("table#movies tbody tr td[1]").map! {|t| t.text}
	# debugger
	assert moviesInPage.size == 0
	# pending # express the regexp above with the code you wish you had
end

Then /^I should see all of the movies$/ do
    moviesInPage = page.all("table#movies tbody tr td[1]").map! {|t| t.text}
  	# debugger
  	assert Movie.all.count == moviesInPage.size
	# pending # express the regexp above with the code you wish you had
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(', ').each do |rating|
  	if uncheck=="un" then
  		uncheck "ratings_"+rating
  	else
  		check "ratings_"+rating
  	end
  end
end
