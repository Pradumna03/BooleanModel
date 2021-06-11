include("path/to/bmodelJl/bmodel.jl")
using Base.Threads

fileList = readdir()
topoFiles = String[]
for i in fileList
	if endswith(i, "topo")
		push!(topoFiles, i)
	end
end

println(Threads.nthreads())


Threads.@threads for topoFile in topoFiles
	y1 = @elapsed x = bmodel_reps(topoFile,100000, 1000, "Async", -1)
	y2 = @elapsed x = bmodel_reps(topoFile,100000, 1000, "Async", 0)
	println(topoFile, " - ", y1, " and " , y2, " seconds.")
end