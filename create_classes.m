function [M_tot, h] = create_classes(total_pop, size_of_class, weight)   
%create_classes Creates a graph structure representing classes within a population.
%   [h] = create_classes(total_pop, size_of_class, weight) 
%   create_classes generates a visual representation of a graph that depicts 
%   the relationship between classes within a population.
%
%   Inputs:
%   - total_pop: Total population size.
%   - size_of_class: Size of each class within the population.
%   - weight: Weight value within smaller classes.
%
%   Outputs:
%   - h: Plot handle for the graph structure.
%
%   Details:
%   This function creates a visual graph representation depicting classes 
%   within a population. It establishes relationships between classes based 
%   on the specified parameters: total population size, class size, and weight. 
%   The function generates a graph structure, assigns weights to the edges, and 
%   visualizes the classes' interconnections.
%
%   Example:
%   Assuming a total population of 100 individuals, with classes of size 10, 
%   and a weight value of 2:
%   h = create_classes(100, 10, 2);
%
%   The function displays a visual graph representing the relationships between different classes within the population.
%
%   Note: The function utilizes MATLAB's graph and plot functions to visualize the graph structure.

%   Detailed explanation:
%   The function creates a graph structure by initializing matrices to represent 
%   class connections and visualizes these connections using MATLAB's graph plotting capabilities.
%   - total_population: Holds the total population size.
%   - class_size: Specifies the size of each class.
%   - num_classes: Calculates the number of classes within the population.
%   - M_pod: Creates a matrix of given weight values for each class.
%   - M_tot: Initializes an empty matrix representing the entire population.
%   - M_off: Sets a matrix representing connections between classes.
%   - The function then populates M_tot based on class connections and applies the weight values.
%   - Finally, it visualizes the graph structure and applies a force-directed layout for better visualization.

    total_population = total_pop;
    class_size = size_of_class;
    num_classes = total_population / class_size;
    M_pod = weight * ones(class_size, class_size);
    M_tot = zeros(total_population, total_population);
    M_off = ones(class_size, class_size);
    
    for i = 1:class_size:total_population
        for j = 1:class_size:num_classes*class_size
            M_tot(i:i+class_size-1, j:j+class_size-1) = M_off;
        end
    end
    
    for i = 1:class_size:total_population
        M_tot(i:i+class_size-1, i:i+class_size-1) = M_pod;
    end
    
    % Visualize the graph structure
    G = graph(M_tot);
    figure;
    h = plot(G, 'NodeColor', 'k', 'EdgeAlpha', 0.01);
    layout(h, 'force', 'WeightEffect', 'inverse');
end