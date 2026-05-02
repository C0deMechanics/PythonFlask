import os.path
import json
import requests
from datetime import datetime

from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError

creds = None

def getCredentials():
  creds = None
  if os.path.exists("token.json"):
    creds = Credentials.from_authorized_user_file("token.json",["https://www.googleapis.com/auth/tasks"])
  if not creds or not creds.valid:
    if creds and creds.expired and creds.refresh_token:
      creds.refresh(Request())
    else:
      flow = InstalledAppFlow.from_client_secrets_file("secretfile.json",["https://www.googleapis.com/auth/tasks"])
      creds = flow.run_local_server(port=0)
    with open("token.json", "w") as token:
      token.write(creds.to_json())
      
  return creds

credsTasks = getCredentials()

def getService():
  return build("tasks", "v1", credentials=credsTasks)

serviceTasks = getService()

def main():
  try:
   getCredentials()
   
  except HttpError as err:
    print(err)

def demonstarteTaskListAPI():
 getCredentials()

#Adds New List 
def addNewTaskList(listName='', items = None):
  myTask = serviceTasks.tasklists().insert(body={'title':listName}).execute()
  taskID = myTask.get('id')
  for task in items:
    serviceTasks.tasks().insert(tasklist=taskID,body={'title':task}).execute()

#Add new Item to List
def addNewTask(listID, newTask):
  serviceTasks.tasks().insert(tasklist=listID,body={'title':newTask}).execute()

#Show Tasklists and ID
def listTaskList():
  result = serviceTasks.tasklists().list(maxResults=10).execute()
  taskList = result.get("items", [])
  for item in taskList:
    itemID = item.get('id')
    itemName = item.get('title')
    print('Title: '+itemName+' ID:'+itemID)

#Show Task from a Tasklist
def getTaskFromList(listID, filter = True):
  tasklist = serviceTasks.tasks().list(tasklist=listID, showHidden=filter).execute()
  tasks = tasklist.get("items",[])
  for task in tasks:
    title = task.get('title')
    id = task.get('id')
    print('Title: '+title+' ID:'+id)

#Update Task

#Delete Task
def deleteTaskWithID(ID):
  serviceTasks.tasklists().delete(tasklist=ID).execute()

#Update Task
def updateTask(toUpdate):
  serviceTasks.tasklists().update(tasklist=toUpdate['id'],body=toUpdate).execute()
  print('update alled')

def getItemOneLevel(itemID):
  mainList = serviceTasks.tasklists().list(maxResults=100).execute()
  mainItems = mainList.get("items",[])
  for item in mainItems:
    ID = item.get('id')
    child = serviceTasks.tasks().list(tasklist=ID,pageToken=None).execute()
    tasks = child.get("items",[])
    for task in tasks:
      if task.get('id') == itemID:
        return task
  return None

#Status:
#completed - checked in google tasks
#needsAction - unchecked in google tasks
def setTaskStatus(itemID,status):
  mainList = serviceTasks.tasklists().list(maxResults=10).execute()
  mainItems = mainList.get("items",[])
  parentKey = None
  toComplete = None
  for item in mainItems:
    ID = item.get('id')
    child = serviceTasks.tasks().list(tasklist=ID,pageToken=None).execute()
    tasks = child.get("items",[])
    for task in tasks:
      if task.get('id') == itemID:
        parentKey = item.get('id')
        toComplete = task
        break

  if toComplete != None:
    toComplete['status'] = status
    serviceTasks.tasks().update(tasklist=parentKey,task=toComplete['id'],body=toComplete).execute()
    print('successfully updated')
  else:
    print('item not found')

#Update TaskList Name
def updateTaskListName(taskListID, newName):
  mainList = serviceTasks.tasklists().list(maxResults=100).execute()
  mainTasklist = mainList.get('items')
  for item in mainTasklist:
    id = item.get('id')
    if id == taskListID:
      item['title'] = newName
      serviceTasks.tasklists().update(tasklist=item['id'], body=item).execute()
      break;

def deleteTaskFromList(taskID):
  mainList = serviceTasks.tasklists().list(maxResults=10).execute()
  mainItems = mainList.get("items",[])
  parentKey = None
  toDelete = None

  for item in mainItems:
    ID = item.get('id')
    child = serviceTasks.tasks().list(tasklist=ID,pageToken=None).execute()
    tasks = child.get("items",[])
    for task in tasks:
      if task.get('id') == taskID:
        parentKey = item.get('id')
        toDelete = task
        break

  if toDelete != None:
   serviceTasks.tasks().delete(tasklist=parentKey,task=taskID).execute()
   return 'item deleted'
  else:
   return 'item not found. Important Note: Repeated task gets regenerated after delete.'	


if __name__ == "__main__":
  main()  


