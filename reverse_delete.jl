using Graphs
using SimpleWeightedGraphs
using GraphPlot
sources =      [0,0,1,1,2,2,2,3,3,4,5,6,6,7]
destinations = [1,7,2,7,3,5,8,4,5,5,6,7,8,8]
weights =      [4,8,8,11,7,4,2,9,14,10,2,1,6,7]

for i in 1:length(sources)
    sources[i] = sources[i] + 1
end


for i in 1:length(sources)
    destinations[i] = destinations[i] + 1
end

g = SimpleWeightedDiGraph(sources, destinations, weights)

function reverse_delete_algorithm(initial_graph)
    edges_initial_graph = collect(edges(initial_graph))
    final_graph = SimpleWeightedGraph(nv(initial_graph))
    digraph = SimpleDiGraph(initial_graph)
    sort!(edges_initial_graph, rev=true, by = weight)
    i = 1
    while (i <= length(edges_initial_graph))
        src = edges_initial_graph[i].src
        dst = edges_initial_graph[i].dst
        w = edges_initial_graph[i].weight
        rem_edge!(digraph,src,dst)
        if (!is_connected(digraph))
            add_edge!(digraph, src, dst)
            add_edge!(final_graph, src, dst, w)
        end
        i += 1
    end
    return final_graph
end
a_g = reverse_delete_algorithm(g)
ef = collect(edges(a_g))
