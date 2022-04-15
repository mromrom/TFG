using Graphs
using SimpleWeightedGraphs
using GraphPlot

function boruvka_algorithm(initial_graph)
    final_mst = SimpleWeightedGraph(nv(initial_graph))
    edges_initial_graph = collect(edges(initial_graph))
    for i in 1: nv(initial_graph)
        edges_to_add_mst = Any[]
        for e in 1: length(edges_initial_graph)
            src=edges_initial_graph[e].src
            dst=edges_initial_graph[e].dst
            if (src == i) | (dst == i)
                push!(edges_to_add_mst,edges_initial_graph[e])
            end
        end
        sort!(edges_to_add_mst, by=weight)
        l_a=length(edges_to_add_mst)
        if l_a != 0
        add_edge!(final_mst, edges_to_add_mst[1])
        end
    end
    #Elimino del grafo inicial la arista que edges_initial_graphñado al nuevo
    #Recorro edges_initial_graph, y mantengo en edges_initial_graph las que no estén contenidas en x, el resto las elimino
    edges_final_mst = collect(edges(final_mst))
    keepat!(edges_initial_graph, findall(x_c->findfirst(isequal(x_c),edges_final_mst)==nothing,edges_initial_graph))
    componentes_grafo = connected_components(final_mst)
    if (componentes_grafo != 1)
        for i in 1:length(componentes_grafo)
            if (length(connected_components(final_mst))!=1)
                aux_boruvka(edges_initial_graph,componentes_grafo[i],final_mst)
            end
        end
    end
    return final_mst
end

# Funcion aux
function aux_boruvka(edges_initial_graph, component, final_mst)
    edges_final = Any[]
    for e = 1:length(component)
        ar = component
        p = findall(
            x -> (x.src == component[e]) | (x.dst == component[e]),
            edges_initial_graph,
        )
        if (p != nothing)
            for i = 1:length(p)
                src = edges_initial_graph[p[i]].src
                dst = edges_initial_graph[p[i]].dst
                src_in_component = findfirst(isequal(src), ar)
                dst_in_component = findfirst(isequal(dst), ar)
                if (src_in_component == nothing) | (dst_in_component == nothing)
                    push!(edges_final, edges_initial_graph[p[i]])
                end
            end
            keepat!(
                edges_initial_graph,
                findall(
                    x -> findfirst(isequal(x), edges_final) == nothing,
                    edges_initial_graph,
                ),
            )
        end
    end
    sort!(edges_final, by = weight)
    add_edge!(final_mst, edges_final[1])
end

sources =      [0,0,1,1,1,2,2,3,3,4,4,4,5,6,7]
destinations = [1,6,2,7,6,3,4,4,5,5,8,7,8,7,8]
weights =      [4.0,7.0,9.0,20.0,11.0,6.0,2.0,10.0,5.0,15.0,5.0,1.0,12.0,1.0,3.0]

for i in 1:length(sources)
    sources[i] = sources[i] + 1
end


for i in 1:length(sources)
    destinations[i] = destinations[i] + 1
end

g = SimpleWeightedGraph(sources, destinations, weights)

g_mst = boruvka_algorithm(g)
edges_mst = collect(edges(g_mst))
