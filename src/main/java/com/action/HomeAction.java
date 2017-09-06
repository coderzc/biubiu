package com.action;

import com.entity.Videos;
import com.entity.modelBeans.PageModel;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by zc on 2016/12/24.
 */
public class HomeAction extends ActionSupport implements ServiceSupport {

    List<Videos> douga = new ArrayList<>();
    List<Videos> fanju = new ArrayList<>();
    List<Videos> music = new ArrayList<>();
    List<Videos> dance = new ArrayList<>();
    List<Videos> game = new ArrayList<>();
    List<Videos> technology = new ArrayList<>();
    List<Videos> life = new ArrayList<>();
    List<Videos> kichiku = new ArrayList<>();
    List<Videos> fashion = new ArrayList<>();
    List<Videos> ad = new ArrayList<>();
    List<Videos> ent = new ArrayList<>();
    List<Videos> film = new ArrayList<>();

    public List<Videos> getDouga() {
        return douga;
    }

    public void setDouga(List<Videos> douga) {
        this.douga = douga;
    }

    public List<Videos> getFanju() {
        return fanju;
    }

    public void setFanju(List<Videos> fanju) {
        this.fanju = fanju;
    }

    public List<Videos> getMusic() {
        return music;
    }

    public void setMusic(List<Videos> music) {
        this.music = music;
    }

    public List<Videos> getDance() {
        return dance;
    }

    public void setDance(List<Videos> dance) {
        this.dance = dance;
    }

    public List<Videos> getGame() {
        return game;
    }

    public void setGame(List<Videos> game) {
        this.game = game;
    }

    public List<Videos> getTechnology() {
        return technology;
    }

    public void setTechnology(List<Videos> technology) {
        this.technology = technology;
    }

    public List<Videos> getLife() {
        return life;
    }

    public void setLife(List<Videos> life) {
        this.life = life;
    }

    public List<Videos> getKichiku() {
        return kichiku;
    }

    public void setKichiku(List<Videos> kichiku) {
        this.kichiku = kichiku;
    }

    public List<Videos> getFashion() {
        return fashion;
    }

    public void setFashion(List<Videos> fashion) {
        this.fashion = fashion;
    }

    public List<Videos> getAd() {
        return ad;
    }

    public void setAd(List<Videos> ad) {
        this.ad = ad;
    }

    public List<Videos> getEnt() {
        return ent;
    }

    public void setEnt(List<Videos> ent) {
        this.ent = ent;
    }

    public List<Videos> getFilm() {
        return film;
    }

    public void setFilm(List<Videos> film) {
        this.film = film;
    }


    @Override
    public String execute() throws Exception {

        PageModel<Videos> pageModel = new PageModel<>(1, 8);

        douga = VIDEO_SERVICE.classify(pageModel, "douga").getDatas();
        fanju = VIDEO_SERVICE.classify(pageModel, "fanju").getDatas();
        music = VIDEO_SERVICE.classify(pageModel, "music").getDatas();
        dance = VIDEO_SERVICE.classify(pageModel, "dance").getDatas();
        game = VIDEO_SERVICE.classify(pageModel, "game").getDatas();
        technology = VIDEO_SERVICE.classify(pageModel, "technology").getDatas();
        life = VIDEO_SERVICE.classify(pageModel, "life").getDatas();
        kichiku = VIDEO_SERVICE.classify(pageModel, "kichiku").getDatas();
        fashion = VIDEO_SERVICE.classify(pageModel, "fashion").getDatas();
        ad = VIDEO_SERVICE.classify(pageModel, "ad").getDatas();
        ent = VIDEO_SERVICE.classify(pageModel, "ent").getDatas();
        film = VIDEO_SERVICE.classify(pageModel, "film").getDatas();

        return SUCCESS;
    }
}
