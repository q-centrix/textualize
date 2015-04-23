When (/^I set up textualize and run "(.*?)"$/) do |command|
  system(
    "cd tmp/aruba && textualize new my-app "\
    "&& cd my-app && npm install && #{command}"
  )
end
