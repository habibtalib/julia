using Statistics, Distributed, Test

# Create QueuePool to call `do_work()` on every submitted job
qp = QueuePool(2, identity, :(using Statistics), 10)

# Queue many jobs (they will immediately start processing)
for idx in 1:100
    push_job!(qp, randn(10, 10), randn(10))
end
