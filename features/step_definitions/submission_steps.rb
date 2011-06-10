Given /a submission titled "([^"]*)"/ do |title|
  When %{I go to the new submission page}
  When %{I fill in "Title" with "#{title}"}
  And %{I select "Science Fiction" from "Genre"}
  And %{I select "Story" from "Kind"}
  And %{I select "Adult" from "Audience"}
  And %{I fill in "Submission" with "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec volutpat velit id elit ultrices cursus. Nulla at quam sed est tempor porttitor et at ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla interdum euismod molestie. Vivamus nisl mi, eleifend a dapibus eu, fringilla quis arcu. Suspendisse iaculis volutpat purus eu aliquam. In dictum vehicula fermentum. Phasellus dictum, nibh id elementum blandit, velit tortor faucibus sapien, in molestie erat velit at orci. In hac habitasse platea dictumst. Vivamus quis elit leo. Nam varius diam et velit scelerisque tempus."}
  And %{I press "Post Submission"}
end