using Graphs
using SimpleWeightedGraphs
using GraphPlot
using SimpleGraphs
sources =      [0,1,2,3,4,1]
destinations = [1,2,0,4,1,3]

for i in 1:length(sources)
    sources[i] = sources[i] + 1
end


for i in 1:length(sources)
    destinations[i] = destinations[i] + 1
end

g = SimpleDiGraph(5)
for i in 1:length(sources)
    add_edge!(g,sources[i], destinations[i])
end
nodelabel = 1:nv(g)
a=collect(vertices(g))
while(length(collect(edges(g)))!=0)
    out_neighbors(g)


curr_path = Any[]
circuit = Any[]
function algoritmo(grafo_inicial, vertice_actual)
    actual_vertex = 1
    while (length(collect(edges(g)))!=0)
        out_n = outneighbors(g,vertice_actual)
        b = length(out_n)
        if (b != 0)
            rem_edge!(g,vertice_actual,out_n[1])
            push!(curr_path, vertice_actual)
            actual_vertex = out_n[1]
        end
    end
end
out_neighbors
cf=outneighbors(g,2)
algoritmo(g,1)
rem_edge!()
