import sys, pygame
from pygame.locals import *
from pygame.constants import *
from OpenGL.GL import *
from OpenGL.GLU import *
from objloader import *
pygame.init()
viewport = (800,600)
hx = viewport[0]/2
hy = viewport[1]/2
srf = pygame.display.set_mode(viewport, OPENGL | DOUBLEBUF)
glEnable(GL_DEPTH_TEST)
obj = OBJ(sys.argv[1], swapyz=True)
clock = pygame.time.Clock()
glMatrixMode(GL_PROJECTION)
glLoadIdentity()
width, height = viewport
gluPerspective(60.0, width/float(height), 1, 100.0)
glEnable(GL_DEPTH_TEST)
glMatrixMode(GL_MODELVIEW)
rx, ry = (0,0)
tx, ty = (0,0)
zpos = 0
rotate = move = False
entry=False
while 1:
    x = glGetDoublev(GL_MODELVIEW_MATRIX)
    print x
    clock.tick(60)
    for e in pygame.event.get():
        if e.type == QUIT:
            sys.exit()
        elif e.type == KEYDOWN:
	  rotate = False	
          if entry==False:
            if e.key == K_ESCAPE:
                sys.exit()
            if e.key == K_UP:
              	if (x[3,0]>-12 and x[3,2]>-11.66): 
              	  ty += 0.0
		elif x[3,1]< -2.7:
		  ty += 0.1
		elif x[3,1]<-0.92:
		  ty -=0.5	
		else : ty-=0.1
		
              
            if e.key == K_DOWN:               
		 ty += 0.1
           
            if e.key == K_LEFT:
                if x[3,0]>10.5:
                  tx-=0
		elif (x[3,0]>-3 and x[3,1]<-1.3216):
		  tx-=0
                else:
                  tx -= -0.1
            if e.key == K_RIGHT:
               if x[3,0]<-30.59:
                  tx+=0
	       elif x[3,0]<-16:
		  tx+=0
               else:
                  tx += -0.1
        
        elif e.type == MOUSEBUTTONDOWN:
            if e.button == 1: rotate = True
        elif e.type == MOUSEMOTION:
            i, j = e.rel
            if rotate:
                rx += i
                ry += j
           
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    if rotate:
      gluLookAt(-tx, -15-ty, 2.0, -tx+rx/10,-15, -ry/10, 0.0, 0.0, 1.0)
    else:
      gluLookAt(0.0, -15.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0)               
      glTranslate(tx, ty, - zpos)   
    glCallList(obj.gl_list)
    pygame.display.flip() 
