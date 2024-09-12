FROM sharelatex/sharelatex:latest
WORKDIR /overleaf
RUN git clone https://github.com/yu-i-i/overleaf-cep.git overleaf-cep
RUN mv overleaf-cep/services/web/modules/track-changes services/web/modules/track-changes
RUN rm -rf overleaf-cep
RUN sed -i "/moduleImportSequence:/a 'track-changes'," services/web/config/settings.defaults.js
RUN sed -i 's/trackChangesAvailable: false/trackChangesAvailable: true/g' services/web/app/src/Features/Project/ProjectEditorHandler.js
RUN tlmgr install scheme-full
