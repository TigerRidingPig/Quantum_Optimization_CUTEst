using CUTEst, NLPModels, JSON, ArgParse

function main()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "problem_name"
        help = "name of the CUTEst problem"
        "x_k"
        help = "optional new guess for x, passed as a JSON-encoded string"
        required = false
        default = "[]"
    end
    args = parse_args(s)
    problem_name = args["problem_name"]
    x_k = JSON.parse(args["x_k"])

    nlp = CUTEstModel(problem_name)

    if !isempty(x_k)
        x_k_converted = Float64.(x_k)  # Use dot syntax to convert each element to Float64
    else
        x_k_converted = nlp.meta.x0  # Use the default initial guess if x_k is empty
    end

    fx = obj(nlp, x_k_converted)
    gx = grad(nlp, x_k_converted)
    Hx = hess(nlp, x_k_converted)

    # Close the NLP model to avoid memory leaks
    finalize(nlp)

    println(JSON.json(Dict("nlp" => nlp, "fx" => fx, "gx" => gx, "Hx" => Hx)))
end

main()
