import sys, pygame
from pygame.locals import *
from pygame.constants import *
from OpenGL.GL import *
from OpenGL.GLU import *
# IMPORT OBJECT LOADER
from objloader import *

#Draw each vertex in the output window
def cord():
    glBegin(GL_LINES_LOOP) #Draws connected lines on screen. The last vertex specified is connected to first vertex.
    for edge in edges:
        for vertex in edge:
            glVertex3fv(vertices[vertex])
    glEnd()     

pygame.init()
viewport = (800,600)
#hx = viewport[0]/2
#hy = viewport[1]/2
srf = pygame.display.set_mode(viewport, OPENGL | DOUBLEBUF)
glEnable(GL_DEPTH_TEST)
obj = OBJ(sys.argv[1], swapyz=True)
glMatrixMode(GL_PROJECTION)
glLoadIdentity()
width, height = viewport
gluPerspective(45, width/float(height), 1, 100.0)#
glEnable(GL_DEPTH_TEST)
glMatrixMode(GL_MODELVIEW)
rx, ry = (0,0)
tx, ty = (0,0)
zpos = 0
rotate = move = False
while 1:
    x = glGetDoublev(GL_MODELVIEW_MATRIX)
    print x
    for e in pygame.event.get():# take input from external devices such as mouse or keyboard
        if e.type == QUIT:
            sys.exit()
        elif e.type == KEYDOWN:
            if e.key == K_ESCAPE:
                sys.exit()
            if e.key == K_s:
                ty -= 1
            if e.key == K_w:
                ty += 1
            if e.key == K_d:
                tx += 1
            if e.key == K_a:
                tx -= 1        
        if e.type == KEYDOWN:
            if e.key == K_DOWN: zpos = max(1, zpos-1) 
            elif e.key == K_UP : zpos += 1    
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    glMatrixMode(GL_PROJECTION);
#glLoadIdentity();
    gluPerspective(0, 1.0, 3.0, 7.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
        # RENDER OBJECT at -3, 3, -9
    gluLookAt(0.0, 10.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0)    
    glTranslate(tx, ty, - zpos)
    glRotate(ry, 1, 0, 0)
    glRotate(rx, 0, 1, 0)
    glRotatef(0, 0, 1, 0)
    #cord()
    glCallList(obj.gl_list)
    # print obj.gl_list
    pygame.display.flip()
