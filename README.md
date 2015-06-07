# sidekiq-problem
Sidekiq perform_async not working

- Inside the project folder type:
1) to start sidekiq:
bundle exec sidekiq -r ./config/boot.rb -v

2) to start app:
rackup

to access the URL that calls the worker:

http://127.0.0.1:9292/hardworker

to inspect sidekiq tasks:
http://127.0.0.1:9292/sidekiq
