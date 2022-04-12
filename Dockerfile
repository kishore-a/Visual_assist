FROM python:3.8
WORKDIR /app
COPY requirement.txt .
COPY ./portaudio ./portaudio
RUN cd portaudio && ./configure && make && make install
RUN pip install pyaudio
RUN pip install -r requirement.txt
COPY ./pytorch ./pytorch
COPY ./yolov4 ./yolov4
RUN pip install SpeechRecognition
RUN pip install SoundFile
RUN pip install librosa
CMD ["python","./pytorch/main.py"]