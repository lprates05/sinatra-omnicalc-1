require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  erb(:hello)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @the_num = params.fetch("number").to_f
  @the_result = @the_num **2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @the_num = params.fetch("number").to_f
  @the_result = @the_num ** (0.5)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_f

  @payment = (@apr/100/12 * @principal) / (1-((1 + @apr/100/12)**(-(@years*12))))

  @apr_print = @apr.round(4).to_fs(:percentage, precision: 4)
  @principal_print = @principal.to_fs(:currency)
  @payment_print = @payment.to_fs(:currency)  

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @num_min = params.fetch("num_min").to_f
  @num_max = params.fetch("num_max").to_f

  @num_random = rand(@num_min..@num_max)
  erb(:random_results)
end
