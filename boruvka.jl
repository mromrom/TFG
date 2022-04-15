using Graphs
using SimpleWeightedGraphs
using GraphPlot
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

function boruvka_algorithm(a_g)
    x = SimpleWeightedGraph(nv(a_g))
    a = collect(edges(a_g))
    for i in 1: nv(a_g)
        b= Any[]
        for e in 1: length(a)
            c_f=a[e].src
            d_f=a[e].dst
            if (c_f == i) | (d_f == i)
                push!(b,a[e])
            end
        end
        sort!(b, by=weight)
        l_a=length(b)
        if l_a != 0
        add_edge!(x, b[1])

        # ed_a = findfirst(isequal(b[1]), a)
        end
    end
    #Elimino del grafo inicial la arista que añado al nuevo
    #Recorro a, y mantengo en a las que no estén contenidas en x, el resto las elimino
    edges_x = collect(edges(x))
    keepat!(a, findall(x_c->findfirst(isequal(x_c),edges_x)==nothing,a))
    componentes_grafo = connected_components(x)
    for i in 1:length(componentes_grafo)
        if (length(connected_components(x))!=1)
        aux_boruvka(a,componentes_grafo[i],x)
        end
    end
    return x
end

j_x = boruvka_algorithm(g)
edges_b = collect(edges(j_x));
edges_g = collect(edges(g));
nodelabel = 1:nv(j_x)
gplot(j_x, nodelabel = nodelabel)
for i in 1:length(edges_b)
    ed_x = edges_b[i]
    ed_a = findfirst(isequal(ed_x),edges_g)
    popat!(edges_g, ed_a)
end
# Funcion aux
function aux_boruvka(edges_grafo_inicial, componente, grafo_final)
    edges_final = Any[]
    for e = 1:length(componente)
        ar = componente
        p = findall(
            x -> (x.src == componente[e]) | (x.dst == componente[e]),
            edges_grafo_inicial,
        )
        if (p != nothing)
            for i = 1:length(p)
                fuente = edges_grafo_inicial[p[i]].src
                destino = edges_grafo_inicial[p[i]].dst
                fuente_f = findfirst(isequal(fuente), ar)
                destino_f = findfirst(isequal(destino), ar)
                if (fuente_f == nothing) | (destino_f == nothing)
                    push!(edges_final, edges_grafo_inicial[p[i]])
                end
            end
            keepat!(
                edges_grafo_inicial,
                findall(
                    x -> findfirst(isequal(x), edges_final) == nothing,
                    edges_grafo_inicial,
                ),
            )
        end
    end
    sort!(edges_final, by = weight)
    add_edge!(grafo_final, edges_final[1])
end
