FROM julia:1.12.6

WORKDIR /home/jovyan

COPY .binder/Project.toml Project.toml
COPY .binder/Manifest.toml Manifest.toml
COPY Geometry_Topology_and_Physics.jl .

RUN julia --project=. -e 'import Pkg; Pkg.instantiate()'

RUN julia --project=. -e 'import Pluto'

EXPOSE 8080

CMD ["julia", "--project=.", "-e", "import Pluto; Pluto.run(host=\"0.0.0.0\", port=8080, launch_browser=false, require_secret_for_access=false, require_secret_for_open_links=false)"]