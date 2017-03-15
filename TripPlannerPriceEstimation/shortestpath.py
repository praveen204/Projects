graph = {'A': ['B', 'C','D','E','F'],
             'B': ['C', 'D','E','F','A'],
             'C': ['D','E','F','A','B'],
             'D': ['E','F','A','B','C'],
             'E': ['F','A','B','C','D'],
             'F': ['E','A','B','C','D']}

def find_path(graph, start, end, path=[]):
        path = path + [start]
        if start == end:
            return path
        if not graph.has_key(start):
            return None
        for node in graph[start]:
            if node not in path:
                newpath = find_path(graph, node, end, path)
                if newpath: return newpath
        return None

def find_all_paths(graph, start, end, path=[]):
        path = path + [start]
        if start == end:
            return [path]
        if not graph.has_key(start):
            return []
        paths = []
        for node in graph[start]:
            if node not in path:
                newpaths = find_all_paths(graph, node, end, path)
                for newpath in newpaths:
                    if len(newpath) == 6: 
                        paths.append(newpath)
        return paths

print find_all_paths(graph,'A','B')


