defmodule InterBack.Verification do  
    use Agent

    def start_link() do  
        Agent.start_link(fn -> %{} end, [name: __MODULE__])
    end 
    
    def put(pid, key, value) do
        Agent.update(pid, &Map.put(&1, key, value))
    end
    
    def get(pid, key) do  
        Agent.get(pid, &Map.get(&1, key))  
    end
    
    def delete_one(pid, key) do
        Agent.update(pid, &Map.delete(&1, key))
    end

end 