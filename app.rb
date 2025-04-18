require "sinatra"
require "sinatra/reloader"

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

  @apr_print = "#{@apr}%"
  @principal_print = "$#{@principal}"
  @payment_print = "$#{@payment.round(2)}"

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end
