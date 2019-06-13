using Test
using OscarPolytope

pts = [1 0 0; 0 0 1]
Q0 = convex_hull(pts)
Q1 = convex_hull(pts, [1;1]);
Q2 = convex_hull(pts, [1;1], [1;1]);
C0 = cube(2)
C1 = cube(2,1,0)

@testset "conformance tests" begin
@test typeof(Q0) == Polyhedron
@test typeof(Q1) == Polyhedron
@test typeof(Q2) == Polyhedron
@test typeof(C0) == Polyhedron
@test typeof(C1) == Polyhedron
@test Q0 == Q0
@test Q0 != Q1
@test C0 != C1
@test C0 == C0
end

@testset "convex_hull" begin
V = vertices(Q0)
@test V == pts 
@test size(vertices(Q1)) == (2,3)
@test size(rays(Q1)) == (2,1)
@test size(lineality_space(Q1)) == (2,0)
@test size(vertices(Q2)) == (2,2)
@test size(rays(Q2)) == (2,0)
@test size(lineality_space(Q2)) == (2,1)
end

@testset "standard constructions" begin
@test size(vertices(C0)) == (2,4)
end
