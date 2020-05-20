/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.clearchunksnew;

/**
 *
 * @author oracle
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.logging.Level;
import org.bukkit.Bukkit;
import org.bukkit.Chunk;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerCommandSendEvent;
import org.bukkit.event.player.PlayerSwapHandItemsEvent;
import org.bukkit.plugin.java.JavaPlugin;

/**
 *
 * @author oracle
 */
public class ClearChunksNew extends JavaPlugin implements Listener {

  @Override
  public void onEnable() {
    getServer().getPluginManager().registerEvents(this, this);
  }
  
    @EventHandler
    public void onChunk(PlayerSwapHandItemsEvent event) {
//        Bukkit.getServer().getWorlds().forEach(w -> {
//                for (Chunk c: w.getLoadedChunks()) {
//                    c.setInhabitedTime(0);
//                }});
        Player player = event.getPlayer();
        Location loc = player.getLocation();
        double myX = loc.getX();
        double myZ = loc.getZ();
        
        Block diamondBlock = null;
        
        double coor[] = null;
        outer: for (double myY = 12; myY >= 4; myY--) {
        double[] prevDelta = null;
        for (int a = 0; true; a++) {
            double[] delta = getDelta(a);

            if (delta[0] == 100)
                break;
                    
            if (prevDelta != null) {
                if (prevDelta[0] != delta[0]) {
                    double z = prevDelta[0];
                    while (z != delta[0]) {
                        if (z < delta[0])
                            z++;
                        else
                            z--;
                        if (z != delta[0]) {
                            //System.out.println("*z "+z + " " + delta[1]);
                            Location testLoc = new Location(player.getWorld(), myX+delta[1], myY, myZ+z);
                            if (testLoc.getBlock().getType() == Material.DIAMOND_ORE) {
                                diamondBlock = testLoc.getBlock();
                                break outer;
                            }
                        }
                    }
                }
                if (prevDelta[1] != delta[1]) {
                    double x = prevDelta[1];
                    while (x != delta[1]) {
                        if (x < delta[1])
                            x++;
                        else
                            x--;
                        if (x != delta[1]) {
                            //System.out.println("*x "+delta[0] + " " + x);
                            Location testLoc = new Location(player.getWorld(), myX+x, myY, myZ+delta[0]);
                            if (testLoc.getBlock().getType() == Material.DIAMOND_ORE) {
                                diamondBlock = testLoc.getBlock();
                                break outer;
                            }
                        }
                    }
                }
            }
            //System.out.println(delta[0] + " " + delta[1]);
            Location testLoc = new Location(player.getWorld(), myX+delta[1], myY, myZ+delta[0]);
            if (testLoc.getBlock().getType() == Material.DIAMOND_ORE) {
                diamondBlock = testLoc.getBlock();
                break outer;
            }
            prevDelta = delta;
        }
            
        }
        if (diamondBlock == null) {
            player.sendMessage("No diamonds nearby ((");
            getLogger().log(Level.INFO, "No diamonds nearby ((");
        } else {
            player.sendMessage("The nearest diamond ore is at " + diamondBlock.getX() + " " + diamondBlock.getY() + " " + diamondBlock.getZ());
            getLogger().log(Level.INFO, "The nearest diamond ore is at " + diamondBlock.getX() + " " + diamondBlock.getY() + " " + diamondBlock.getZ());
        }
    }
    
    public static double[] getDelta(int a) {
        int deltaX = 0;
        int deltaZ = 0;

        if (a > 0) {
            int modZ = (a-1) % 4;
            int signZ = modZ < 2 ? 1 : -1;
            deltaZ = ((a - 1)/4 + 1) * signZ;
        }

        if (a > 1) {
            int modX = (a-2) % 4;
            int signX = modX < 2 ? -1 : 1;
            deltaX = ((a - 2)/4 + 1) * signX;
        }
        
        return new double[]{deltaZ, deltaX};        
    }

}
