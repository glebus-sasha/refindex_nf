# refindex_nf
Nextflow-based pipeline for BWA index and samtools (fai) index

This pipeline is prepared for:
- [glebus-sasha/deepvariant_nf](https://github.com/glebus-sasha/deepvariant_nf)
- [glebus-sasha/octopus_nf](https://github.com/glebus-sasha/octopus_nf)

```mermaid
%%{init: {'theme':'base'}}%%
flowchart TB
    subgraph " "
    v0["reference"]
    end
    v1([REFINDEX])
    v2([FAINDEX])
    subgraph " "
    v9["indices"]
    end
    v0 --> v1
    v0 --> v2
    v1 --> v9
    v2 --> v9
```

## Description

The pipeline is implemented in Nextflow and includes several stages for NGS data analysis:

1. **REFINDEX:** Index creation using BWA (Burrows-Wheeler Aligner).
2. **FAINDEX:** Fai index creation using Samtools faidx

## Usage

### Quick Start

To quickly run the pipeline, use the following command:

```bash
nextflow run glebus-sasha/refindex_nf \
    -profile <docker/singularity> \
    --reference <path-to-reference> \
    --bwaidx <bwaidx-output-folder> \
    --faidx <faidx-output-folder>
```

### Requirements

- Nextflow (https://www.nextflow.io/docs/latest/install.html)
- Docker (https://docs.docker.com/engine/install/) or
- Singularity (https://github.com/sylabs/singularity/blob/main/INSTALL.md)

### Running the Pipeline

1. Install all the necessary dependencies such as Nextflow, Singularity.
2. Clone this repository: `git clone https://github.com/glebus-sasha/refindex_nf.git`
3. Navigate to the pipeline directory: `cd refindex_nf`
4. Edit the `nextflow.config` file to set the required parameters, if necessary.
5. Run the pipeline, setting the required parameters, for example:

```bash
nextflow run main.nf
```

## License

This project is licensed under the [MIT License](LICENSE).
