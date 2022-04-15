4+3
1
456/78
a=2;
println(a)
2^2;

repeat
g=path_graph(6)
using TikzGraphs
TikzGraphs.plot(g)
using Graphs

g=path_graph(6)
plot(g)

t=plot(g)
g=wheel_graph(10)

plot(g)
using TikzPictures

save(SVG("wheel10.svg"), t)
g = wheel_graph(10); t = plot(g);
save(SVG("wheel10"), t)
savefig(SVG("wheel10.svg"), t)
tp = TikzPicture("\\draw (0,0) -- (10,10);\n\\draw (10,0) -- (0,10);\n\\node at (5,5) {tikz \$\\sqrt{\\pi}\$};", options="scale=0.25", preamble="")
save(PDF("test"), tp)
using GraphRecipes

graphplot(g)

GraphRecipes.graphplot(g, curves=false
import GraphRecipes
import TikzGraphs
import Graphs
import Plots
graphplot(g, curves=false)

g=path_graph(6)

graphplot(g,curves=true)

g=path_digraph(19)

graphplot(g,curves=true)

g=wheel_digraph(5)

graphplot(g,curves=true)

A2=[2 7; 5 0]

b=SimpleDiGraph(A2)

graphplot(b, curves=true)

A2=[1 0; 0 1]
using GraphPlot
using Compose
using Cairo
using Fontconfig
draw(PNG("wheel10.png", 16cm, 16cm), gplot(b))
nodelabel = 1:nv(b)
gplot(b, nodelabel=nodelabel)
a2=[0 1; 0 0]

b=SimpleDiGraph(a2)
using SimpleWeightedGraphs
using SimpleWeightedGraphs
using Graphs
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

gplot(g)


nodelabel = 1:nv(g)

gplot(g, nodelabel=nodelabel)
x=edges(g)
gf=collect(edges(g))
typeof(gf)
sort(gf, by=src)
a=gf[1].
g_h = [1,2]
connected_components(g)

b = Any[]
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
        ed_a = findfirst(isequal(b[1]), a)
        end
    end
    return x
end

j_x = boruvka_algorithm(g)
edges_b = collect(edges(j_x));
edges_g = collect(edges(g));
for i in 1:length(edges_b)
    ed_x = edges_b[i]
    ed_a = findfirst(isequal(ed_x),edges_g)
    popat!(edges_g, ed_a)
end
# Funcion aux
edges_final = Any[]
for e in 1: length(cm[2])
    ar=cm[2]
    p = findall(x-> (x.src == ar[e]) | (x.dst == ar[e]), edges_g)
    if(p!= nothing)
        for i in 1:length(p)
            fuente = edges_g[p[i]].src
            destino = edges_g[p[i]].dst
            fuente_f = findfirst(isequal(fuente), ar)
            destino_f = findfirst(isequal(destino), ar)
            if (fuente_f == nothing) | (destino_f == nothing)
                push!(edges_final, edges_g[p[i]])
            end
        end
        keepat!(edges_g, findall(x->findfirst(isequal(x),edges_final)==nothing,edges_g))
    end
end
sort!(edges_final, by=weight)
add_edge!(j_x,edges_final[1])
# Funcion aux

nodelabel = 1:nv(j_x)
gplot(j_x, nodelabel = nodelabel)
aristas = collect(edges(j_x))
cm= connected_components(j_x)
c_m = cm[1]
c_2 = cm[2]
function boruvka_aux(initial_edges,component)


h=SimpleWeightedGraph(3)

add_edge!(h,1,2)
gplot(h)
using Debugger
