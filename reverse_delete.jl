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

g = SimpleWeightedGraph(sources, destinations, weights)
edges_initial_graph = collect(edges(g))

function reverse_delete_algorithm(initial_graph)
    edges_initial_graph = collect(edges(initial_graph))
    sort!(edges_initial_graph, rev=true, by = weight)
    i = 1
    while (length(edges_initial_graph) != 0 && i<= length(edges_initial_graph))
        rem_edge!(initial_graph, edges_initial_graph[i].src, edges_initial_graph[i].dst)
        if (!is_connected(initial_graph))
            add_edge!(initial_graph, edges_initial_graph[i].src, edges_initial_graph[i].dst,edges_initial_graph[i].weight)
        end
    end
    return initial_graph
end

reverse_delete_algorithm(g)
