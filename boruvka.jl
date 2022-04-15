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
