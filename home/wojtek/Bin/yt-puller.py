#!/usr/bin/python

from os import makedirs, path
from configparser import ConfigParser
from threading import Thread, current_thread
from json import JSONDecoder
import subprocess
import re


pullerDataPath = '/home/wojtek/.config/yt-puller/config'
pullerBinaryPath = '/home/wojtek/Bin/pull_yt_podcast.sh'
podcastsDir = '/home/wojtek/Podcasts/'
youtube_dl = '/usr/local/bin/youtube-dl'

def getDwnList(**kwargs):
    param = kwargs
    if 'max' not in param:
        param['max'] = '20'
    proc = subprocess.run([youtube_dl, param['url'], '-s', '--max-downloads', param['max'], '--print-json'], capture_output=True, text=True)

    lines = proc.stdout.split('\n')
    d = JSONDecoder()
    items = [d.decode(line) for line in proc.stdout.split('\n') if(line != '')]

    dwnList = []
    for item in items:
        if(re.search(param['search_pattern'], item['fulltitle']) != None):
            format = [f for f in item['formats'] if f['format_id'] == param['format']]
            dwnList.append({
                'fulltitle': item['fulltitle'].replace('/', '\\'),
                'url': format[0]['url'],
                'ext': format[0]['ext']
            })
    return dwnList

def runPullerWithParams(**kwargs):
    param = kwargs
    dwnList = getDwnList(**kwargs)
    makedirs(podcastsDir + param['dir'], exist_ok=True)
    for dwn in dwnList:
        fullFileDir = podcastsDir + param['dir'] + '/'
        fullFileName = dwn['fulltitle'] + '.' + dwn['ext']
        if(path.exists(fullFileDir + 'rename')):
            proc = subprocess.run([fullFileDir + 'rename', fullFileName], capture_output=True, text=True)
            fullFileName = proc.stdout
        fullFilePath = fullFileDir + fullFileName
        if(not path.exists(fullFilePath)):
            proc = subprocess.run([youtube_dl, dwn['url'], '-o', fullFilePath], capture_output=True)
            if(proc.returncode == 0):
                subprocess.run(['/usr/bin/notify-send', '-c', 'transfer.complete', 'New "' + param['dir'] + '" downloaded: ' + dwn['fulltitle']])

def getParamsFromConfig(config):
    podcastParams = []
    for podcast in config:
        param = {}
        for key in config[podcast]:
            param[key] = config[podcast][key]
        param['dir'] = podcast
        if(podcast != "DEFAULT"):
            podcastParams.append(param)
    return podcastParams

config = ConfigParser()
config.read(pullerDataPath)
podcastParams = getParamsFromConfig(config)

threads = []
for param in podcastParams:
    threads.append(Thread(target=runPullerWithParams, kwargs=param, name=param["search_pattern"]))
    threads[len(threads)-1].start()

for t in threads:
    t.join()
