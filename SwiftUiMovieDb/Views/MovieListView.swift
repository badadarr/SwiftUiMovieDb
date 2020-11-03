//
//  MovieListView.swift
//  SwiftUiMovieDb
//
//  Created by badar on 02/11/20.
//  Copyright © 2020 badar. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upComingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    if nowPlayingState.movies != nil  {
                        MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)
                    } else {
                        LoadingView(isLoading: nowPlayingState.isLoading, error: nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                
                Group {
                    if upComingState.movies != nil  {
                        MovieBackdropCarouselView(title: "Up Coming", movies: upComingState.movies!)
                    } else {
                        LoadingView(isLoading: upComingState.isLoading, error: upComingState.error) {
                            self.upComingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

                
                Group {
                    if topRatedState.movies != nil  {
                        MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                    } else {
                        LoadingView(isLoading: topRatedState.isLoading, error: topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

                
                Group {
                    if popularState.movies != nil  {
                        MovieBackdropCarouselView(title: "Popular", movies: popularState.movies!)
                    } else {
                        LoadingView(isLoading: popularState.isLoading, error: popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                
            }
        .navigationBarTitle("The MovieDb")
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upComingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
    }
}
        
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
 
