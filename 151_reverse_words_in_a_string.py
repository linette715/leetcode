class Solution(object):
    def reverseWords(self, s):
        """
        :type s: str
        :rtype: str
        """
        arr = [word.strip(" ") for word in s.split(" ") if word != ""]
        arr.reverse()
        return " ".join(i for i in arr)
        