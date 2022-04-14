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

sources = [0,0,1,1,1,2,2,3,3,4,4,4,5,6,7]
for i in 1:length(sources)
    sources[i] = sources[i] + 1
end


destinations = [1,6,2,4,6,3,4,4,5,5,7,8,8,7,8]
for i in 1:length(sources)
    destinations[i] = destinations[i] + 1
end
weights = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

g = SimpleWeightedGraph(sources, destinations, weights)
add_vertex!(g)
nodelabel = 1:nv(g)

gplot(g, nodelabel=nodelabel)
x=edges(g)
gf=collect(edges(g))
a=gf[1].src

connected_components(g)

for i in 1: nv(g)
    a = collect(edges(g))
    b = Any[]
    for e in 1: length(a)
        if(a[e].src == i)
            push!(b,a[e]);
        end
    end
end
using Debugger
