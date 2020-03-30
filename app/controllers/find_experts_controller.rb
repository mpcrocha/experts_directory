# frozen_string_literal: true

class FindExpertsController < ApplicationController
  def index
    @members = Member.all
  end

  def find_experts
    member_topic_knowledge = Member.joins(:headings).where("headings.topic LIKE '%#{params[:q]}%'")

    @path = shortest_path_to_member(Member.find(params[:member]), member_topic_knowledge.first)
  end

  def shortest_path_to_member(initial_member, target_member)
    return nil if initial_member.nil? || target_member.nil?

    return nil if initial_member == target_member

    to_visit = []
    shortest_path = {}

    to_visit.append(initial_member)
    shortest_path[initial_member] = nil

    while to_visit
      current_member = to_visit.pop

      break if current_member == target_member

      next if current_member.member_friends.nil?

      current_member.member_friends.each do |friend|
        unless shortest_path.key?(friend)
          to_visit.append(friend)
          shortest_path[friend] = current_member
        end
      end
    end

    return nil if shortest_path[target_member].nil?

    create_path(shortest_path, target_member)
  end

  def create_path(shortest_path, target_member)
    path = []
    curr_member = target_member
    while curr_member
      path.append(curr_member.name)
      curr_member = shortest_path[curr_member]
    end
    path.reverse!
  end
end
