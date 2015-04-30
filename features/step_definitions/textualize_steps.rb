When (/^I set up Textualize and run "(.*?)"$/) do |command|
  system(
    "cd tmp/aruba && textualize new my-app "\
    "&& cd my-app && npm install && gulp && #{command}"
  )
end
