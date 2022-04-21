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
graph_edges = collect(edges(g))
while(length(collect(edges(g)))!=0)
    out_neighbors(g)



function hierholzer_algorithm(grafo_inicial)
    curr_path = Any[]
    circuit = Any[]
    actual_vertex = 1
    while (length(collect(edges(g)))!=0)
        out_n = outneighbors(g,actual_vertex)
        b = length(out_n)
        if (b != 0)
            dst_vertex = out_n[1]
            if (!isempty(curr_path) && curr_path[end] != actual_vertex)
                rem_edge!(g,actual_vertex,dst_vertex)
                push!(curr_path, actual_vertex)
            elseif (!isempty(curr_path) && curr_path[end] == actual_vertex)
                rem_edge!(g,actual_vertex,dst_vertex)
            elseif (isempty(curr_path))
                rem_edge!(g,actual_vertex,dst_vertex)
                push!(curr_path, actual_vertex)
            end
            actual_vertex = dst_vertex
        else
            push!(circuit, actual_vertex)
            vertex_before = curr_path[end]
            if (curr_path[end] == actual_vertex)
                pop!(curr_path)
                vertex_before = curr_path[end]
            end
            actual_vertex = vertex_before
        end
    end
    push!(curr_path, actual_vertex)
    reverse!(curr_path)
    append!(circuit,curr_path)
    reverse!(circuit)
    return circuit
end
g = SimpleDiGraph(5)
for i in 1:length(sources)
    add_edge!(g,sources[i], destinations[i])
end
res = algoritmo(g)
!isempty([1,2])
rem_edge!()
